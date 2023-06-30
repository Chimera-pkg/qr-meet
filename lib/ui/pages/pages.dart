import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';
import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:PictSnap/methods/methods.dart';
import 'package:PictSnap/ui/components/components.dart';
import 'package:PictSnap/main.dart';
import 'package:PictSnap/models/models.dart';
import 'package:PictSnap/services/services.dart';
import 'package:PictSnap/providers/providers.dart';
import 'package:PictSnap/shared/shared.dart';
import 'package:PictSnap/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

part 'choose_type_page.dart';
part 'start_page.dart';
part 'sign_in_page.dart';

part 'detail_type_page.dart';
part 'detail_peview_booth_page.dart';
