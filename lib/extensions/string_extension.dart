
extension StringExtensions on String {
  String capitalizeFirst() {
    if(isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1)}";
    }else{
      return this;
    }
  }
}

