import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:youplanner/core/data/res/data_constants.dart';
import 'package:youplanner/models/tasks.dart';

final taskDBS = DatabaseService<Tasks>(AppDBConstants.tasksCollection,
    fromDS: (id, data,) => Tasks.fromDS(id, data),
    toMap: (task) => task.toMap());
