String truncateText(String text, int maxLength, {bool addEllipsis = true}) {
  if (text.length <= maxLength) return text;

  return addEllipsis
      ? '${text.substring(0, maxLength).trim()}...'
      : text.substring(0, maxLength).trim();
}