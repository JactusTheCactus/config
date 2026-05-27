# TODO
{%- if buy | length > 0 %}
1. **Buy**:
{%- for b in buy %}
	1. `{{ b.name }}` (`{{ b.price }}`)
{%- endfor -%}
{%- endif -%}
{%- if vms | length > 0 %}
1. **Setup _VM_s**:
{%- for v in vms %}
	1. `{{ v }}`
{%- endfor -%}
{%- endif -%}
