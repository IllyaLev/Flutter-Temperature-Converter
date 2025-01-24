import 'dart:ffi' as ffi;
import 'dart:io' show Platform;

final String libPath = Platform.isWindows ? './rust_lib/target/release/rust_lib.dll'
                                          : Platform.isMacOS ? './rust_lib/target/release/rust_lib.dylib'
                                          : './rust_lib/target/release/rust_lib.so';

final ffi.DynamicLibrary dylib = ffi.DynamicLibrary.open(libPath);

typedef celsius_to_fahrenheit_func = ffi.Double Function(ffi.Double);
typedef CelsiusToFahrenheit = double Function(double);

typedef fahrenheit_to_celsius_func = ffi.Double Function(ffi.Double);
typedef FahrenheitToCelsius = double Function(double);

final CelsiusToFahrenheit celsiusToFahrenheit = dylib
      .lookup<ffi.NativeFunction<celsius_to_fahrenheit_func>>('celsius_to_fahrenheit')
      .asFunction();

final FahrenheitToCelsius fahrenheitToCelsius = dylib
      .lookup<ffi.NativeFunction<fahrenheit_to_celsius_func>>('fahrenheit_to_celsius')
      .asFunction();