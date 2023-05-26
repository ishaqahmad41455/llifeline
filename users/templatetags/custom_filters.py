from django import template

register = template.Library()

@register.filter
def add_css_classes(field, css_classes):
    existing_classes = field.field.widget.attrs.get('class', '')
    field.field.widget.attrs['class'] = f'{existing_classes} {css_classes}'
    return field
