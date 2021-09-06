## Script for SUM Block Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Height
if n_OR_inputs == 0 :
	OR_Height=0
else:
	OR_Height=(n_OR_inputs * 30) + 20
if n_AND_inputs == 0 :
	AND_Height=0
else:
	AND_Height=(n_AND_inputs * 30) + 20
SUMHeight = OR_Height + AND_Height

##BlockHeight = ((n_OR_inputs * 30) + 20) + ((n_AND_inputs * 30) + 20)
widget.setPropertyValue('height', SUMHeight)

## Visibility - Invisible when AND inputs is zero, except the case where AND input =0 and  OR input is 1.
if n_AND_inputs <= 0 and n_OR_inputs >= 2:
	widget.setPropertyValue('visible', False)
else:
	widget.setPropertyValue('visible', True)

