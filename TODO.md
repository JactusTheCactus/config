# TODO
1. Buy `{{laptop.name}}` Laptop (`{{laptop.price}}`)
{% if vms | length > 0 %}1. Setup VMs
	{% for vm in vms %}- `{{ vm }}`
	{% endfor %}
{% endif %}
