## Script for SUM Output behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Y Position
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

Y_Pos = (SUMHeight / 2) -10
widget.setPropertyValue('y', Y_Pos)

## X Position - Special case when AND inputs == 0 and OR inputs is not <=1
if n_AND_inputs==0 and n_OR_inputs>=2:
    widget.setPropertyValue('x', 400)
else:
    widget.setPropertyValue('x', 450)
