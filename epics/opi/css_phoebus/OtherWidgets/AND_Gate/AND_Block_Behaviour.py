## Script for AND Block Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Block Height
BlockHeight = (n_AND_inputs * 30) + 20
widget.setPropertyValue('height', BlockHeight)

## Y Position - Depending on the Input Number of the OR input.
Y_Pos = (n_OR_inputs * 30) + 20
widget.setPropertyValue('y', Y_Pos)

## Visibility - Hide in the following cases:
##		- AND inputs is zero
##		- AND inputs is 1 and OR inputs <= 1. 
##		- AND inputs is >=2 and OR inputs <= 1
##   This means the 'AND' block remains visible in cases where it has just one input.
if n_AND_inputs == 0:
    widget.setPropertyValue('visible', False)
elif (n_AND_inputs == 1) and (n_OR_inputs <=1):
    widget.setPropertyValue('visible', False)
elif (n_AND_inputs >= 2) and (n_OR_inputs <=1):
    widget.setPropertyValue('visible', False)
else:
    widget.setPropertyValue('visible', True)
