String convertDateTimeToPresentation(DateTime date){
  return "${date.hour}:${date.minute} ${date.hour < 12 ? "AM" : "PM"}";
}