// import 'dart:async';

// import 'dart:math';

import 'dart:async';
import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_helpers/firebase_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:youplanner/models/models.dart';
import 'package:youplanner/models/tasks.dart';
import 'package:youplanner/services/services.dart';
import 'package:youplanner/services/task_services.dart';
import 'package:flutter/rendering.dart';
import 'package:youplanner/shared/shared.dart';
import 'dart:math' as math;

import 'package:youplanner/ui/pages/stopwatch/classes/dependencies.dart';
import 'package:youplanner/ui/pages/stopwatch/screen/main_screen_landscape.dart';
import 'package:youplanner/ui/pages/stopwatch/screen/main_screen_portrait.dart';


part 'login.dart';
part 'mainmenu.dart';
part 'splash.dart';
part 'onboarding.dart';
part 'forgotpass.dart';
part 'resetpass.dart';
part 'passwordchagedsuccess.dart';
part 'register.dart';
part 'mytask/mytask.dart';
part 'clock/clock.dart';
part 'stopwatch/stopwatch.dart';
part 'myprofile/myprofile.dart';
part 'mytask/addtask.dart';
part 'taskdetails.dart';
part 'stopwatch/classes/clock_painter.dart';