String validateIfEmpty(String value, {String message = 'Field cannot be empty'}) {
  return (value == null || value.isEmpty) ? message : null;
}
