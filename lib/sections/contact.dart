import 'package:devfolio/components/contact.dart';
import 'package:devfolio/models/contact.dart';
import 'package:jaspr/jaspr.dart';

class ContactSection extends StatelessComponent {
  final List<Contact> contacts;
  const ContactSection({
    super.key,
    required this.contacts,
  });

  @override
  Iterable<Component> build(BuildContext context) sync* {
    yield section(classes: 'contact-section', [
      span(classes: 'title', [
        text('Let’s get in touch'),
      ]),
      div(styles: Styles.box(height: 15.px), []),
      span(classes: 'subtitle', [
        text("To transform your vision into a successful reality"),
      ]),
      div(classes: 'contact-body', id: 'contact', [
        for (final contact in contacts)
          ContactCard(
            icon: contact.icon,
            title: contact.title,
            description: contact.description,
            action: contact.action,
          ),
      ])
    ]);
  }

  @css
  static final List<StyleRule> styles = [
    css('.contact-section')
        .flexbox(
          direction: FlexDirection.column,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.start,
        )
        .box(
          padding: EdgeInsets.symmetric(vertical: 5.vh, horizontal: 10.vw),
        ),
    css('.contact-body')
        .flexbox(
          direction: FlexDirection.row,
          alignItems: AlignItems.center,
          justifyContent: JustifyContent.center,
          wrap: FlexWrap.wrap,
        )
        .box(
          margin: EdgeInsets.only(top: 50.px),
          width: 100.percent,
        ),
  ];
}
