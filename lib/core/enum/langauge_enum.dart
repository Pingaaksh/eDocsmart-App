enum LanguageEnum {
  english('English', 'EN'),
  arabic('Arabic', 'AR');

  final String languageName;
  final String slug;

  const LanguageEnum(this.languageName, this.slug);
}
