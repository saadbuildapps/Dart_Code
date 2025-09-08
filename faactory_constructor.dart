class Logger {
  static final Logger _instance = Logger._internal();

  factory Logger() {
    return _instance;
  }

  Logger._internal();  // Private Constructor
}

void main() {
  var log1 = Logger();
  var log2 = Logger();

  print(log1 == log2);  // true
}
