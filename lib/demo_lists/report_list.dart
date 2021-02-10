import 'package:flutter/material.dart';

class Reports {
  final int id;
  final String date;
  final String time;
  final String location;
  final String disasterType;
  final String description;

  Reports(
      {@required this.id,
      @required this.date,
      @required this.time,
      @required this.location,
      @required this.disasterType,
      this.description});
}

//demo reports
List<Reports> demoReports = [
  Reports(
      id: 001,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 002,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 003,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 004,
      date: '2020-01-10',
      time: '10:40 AM',
      location: null,
      disasterType: null),
  Reports(
      id: 005,
      date: '2020-01-10',
      time: '11:20 AM',
      location: null,
      disasterType: null),
  Reports(
      id: 006,
      date: '2020-01-10',
      time: '04:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 007,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 008,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
  Reports(
      id: 009,
      date: '2020-01-10',
      time: '02:05 PM',
      location: null,
      disasterType: null),
];
