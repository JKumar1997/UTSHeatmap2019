public String unixDateTime() {
  String format = "yyyy-MM-dd HH:mm";
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
  Calendar c = Calendar.getInstance();
  c.add(Calendar.DAY_OF_MONTH, -2);
  String delay = simpleDateFormat.format(c.getTime());
  return delay;
}

public Date getDateFrom() {
  Calendar c = Calendar.getInstance();
  c.add(Calendar.DAY_OF_MONTH, -2);
  c.add(Calendar.HOUR, -1);
  return c.getTime();
}

public Date getDate() {
  Calendar c = Calendar.getInstance();
  c.add(Calendar.DAY_OF_MONTH, -2);
  return c.getTime();
}

public String getTime() {
  String format = "HH:mm";
  SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
  String time = simpleDateFormat.format(new Date());
  return time;
}
