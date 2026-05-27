# TODO
{%- if buy | length > 0 -%}
1. Buy:
{%- for b in buy -%}
	- `{{ b.name }}` (`{{ b.price }}`)
{%- endfor -%}
{%- endif -%}
{%- if vms | length > 0 -%}
1. Setup VMs:
{%- for v in vms -%}
	- `{{ v }}`
{%- endfor -%}
{%- endif -%}
