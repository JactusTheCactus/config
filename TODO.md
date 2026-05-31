# TODO
{%- if buy | length > 0 %}
1. **Buy**:
{%- for b in buy %}
	{% set diff = (b.price - 1507.28) | round(2) -%}
	1. `{{ b.name }}` (`${{ b.price }}`
		{%- if diff > 0 %} [${{ diff }} away] {%- endif %})
{%- endfor -%}
{%- endif -%}
{%- if vms | length > 0 %}
1. **Setup VMs**:
{%- for v in vms %}
	1. `{{ v }}`
{%- endfor -%}
{%- endif -%}
