## Script for Release LED Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variables
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Y Position
##   - Bottom corner
Y_Pos = ((n_OR_inputs * 30) + 20) + (((n_AND_inputs * 30) + 20)) - 15
##   - Top corner
## Y_Pos = ((n_OR_inputs * 30) + 20)

## X Position - Move to the right when AND block is invisible 
##    (i.e. when number of OR inputs is less than or equal to 1)
if n_OR_inputs <= 1:
    widget.setPropertyValue('x', 85)
else:
    widget.setPropertyValue('x', 35)
widget.setPropertyValue('y', Y_Pos)

## Visibility
if n_AND_inputs <= 1:
    widget.setPropertyValue('visible', False)
else:
    widget.setPropertyValue('visible', True)