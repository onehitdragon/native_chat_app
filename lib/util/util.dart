String convertDateTimeToPresentation(DateTime date){
  return "${date.hour}:${date.minute} ${date.hour < 12 ? "AM" : "PM"}";
}

String convertNumberToSingleTime(int n){
  if(n < 10){
    return "0$n";
  }
  else{
    return "$n";
  }
}

String convertNumberToTime(int n){
  if(n < 60){
    return "00:${convertNumberToSingleTime(n)}";
  }
  else{
    return "${convertNumberToSingleTime((n / 60).round())}:${convertNumberToSingleTime(n % 60)}";
  }
}