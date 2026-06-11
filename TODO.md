# TODO
1. **Buy**:
	{%- for b in buy %}
	{% set diff = (b.price - bank) | round(2) -%}
	1. `{{ b.name }}` (`${{ b.price }}`
		{%- if diff > 0 %} [`${{ diff }}` away] {%- endif %})
	{%- endfor -%}
