import 'package:gimme_delivery/core/log/filter/release_log_filter.dart';
import 'package:gimme_delivery/core/log/printer/simple_log_printer.dart';
import 'package:gimme_delivery/core/network/http_module.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@module
abstract class RegisterModule {
  Logger get logger => Logger(
        printer: SimpleLogPrinter(),
        filter: ReleaseLogFilter(),
      );

  @LazySingleton()
  HttpModule get httpModule => HttpModule();
}
