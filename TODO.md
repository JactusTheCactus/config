# TODO
{%- if buy | length > 0 %}
1. **Buy**:
{%- for b in buy %}
	1. `{{ b.name }}` (`${{ b.price }}` [${{ (b.price - 1507.28) | round (2) }} away])
{%- endfor -%}
{%- endif -%}
{%- if vms | length > 0 %}
1. **Setup VMs**:
{%- for v in vms %}
	1. `{{ v }}`
{%- endfor -%}
{%- endif -%}
