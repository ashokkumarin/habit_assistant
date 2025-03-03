import 'package:flutter/material.dart';
import 'package:myhabitassistant/widgets/appbar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:myhabitassistant/widgets/navigation_menu.dart' as custom; // Import the custom navigation menu

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime _selectedDate = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitAssistantAppBar(
        title: "Main page",
      ),
      drawer: const custom.NavigationDrawer(), // Your navigation menu
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton<int>(
                  value: _selectedDate.month,
                  items: List.generate(12, (index) {
                    return DropdownMenuItem(
                      value: index + 1,
                      child: Text(
                        '${DateTime(0, index + 1).toLocal().toString().split(" ")[0].split("-")[1]}',
                      ),
                    );
                  }),
                  onChanged: (int? newMonth) {
                    if (newMonth != null) {
                      setState(() {
                        _selectedDate = DateTime(_selectedDate.year, newMonth, _selectedDate.day);
                        _focusedDay = _selectedDate;
                      });
                    }
                  },
                ),
                SizedBox(width: 20),
                DropdownButton<int>(
                  value: _selectedDate.year,
                  items: List.generate(20, (index) {
                    int year = DateTime.now().year - 10 + index;
                    return DropdownMenuItem(
                      value: year,
                      child: Text('$year'),
                    );
                  }),
                  onChanged: (int? newYear) {
                    if (newYear != null) {
                      setState(() {
                        _selectedDate = DateTime(newYear, _selectedDate.month, _selectedDate.day);
                        _focusedDay = _selectedDate;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5, // 50% height
            padding: EdgeInsets.all(8.0),
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              calendarFormat: CalendarFormat.month,
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Text('Other Content Goes Here'),
            ),
          ),
        ],
      ),
    );
  }
}
