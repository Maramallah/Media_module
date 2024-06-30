import 'package:flutter/material.dart';
import 'package:media/Models/CategryItem.dart';
import 'package:media/Models/EventItem.dart';

import "../Widgets/categoryWidget.dart";
import "../Widgets/eventWidget.dart";
import 'package:table_calendar/table_calendar.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  _EventsScreenState createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final categories = [
    CategoryModel(icon: Icons.work, label: 'Workshops'),
    CategoryModel(icon: Icons.event, label: 'Seminars'),
    CategoryModel(icon: Icons.school, label: 'College'),
  ];

  final events = [
    EventModel(
      title: 'Sports Meet in Galaxy Field',
      date: 'Jan 12, 2019',
      location: 'Greenfields, Sector 42, Faridabad',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    EventModel(
      title: 'Art & Meet in Street Plaza',
      date: 'Jan 12, 2019',
      location: 'Galaxyfields, Sector 22, Faridabad',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    EventModel(
      title: 'Youth Music in Galleria',
      date: 'Jan 12, 2019',
      location: 'Galleria, Faridabad',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            color: Color.fromARGB(255, 6, 61, 12), // Example background color
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Let's explore what's happening nearby",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: categories
                      .map((category) => CategoryItem(categoryModel: category))
                      .toList(),
                ),
              ],
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          
            child: Text(
              "All Events",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event.title),
                  subtitle: Text('${event.date}\n${event.location}'),
                  isThreeLine: true,
                  leading: Image.network(event.imageUrl),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
