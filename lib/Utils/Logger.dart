class Logger {
  log(String title, {dynamic value = ""}) {
    print("\n\n");
    print("*********  Pretty Logger **************************");
    print("---------------------------------");
    print(title.toUpperCase());
    print("---------------------------------");
    print(value);
    print("\n\n");
  }
}
