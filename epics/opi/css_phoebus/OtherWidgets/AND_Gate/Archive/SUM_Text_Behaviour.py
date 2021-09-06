## Script for SUM Text Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Text
if n_AND_inputs == 1 and n_OR_inputs == 1:
	widget.setPropertyValue('text', '-->')
else:
	widget.setPropertyValue('text', 'AND')

