## Script for 'AND' Inputs Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
n_AND_inputs = PVUtil.getDouble(pvs[1])

## Macro variables
macros = widget.getEffectiveMacros()
macros.expandValues(macros)
InputNum = macros.getValue('InputNum')
InputNum = int(InputNum)

## X Position - Move inputs right 50pts if the OR block is invisible; otherwise position at the AND block.
if n_OR_inputs <= 1:
    widget.setPropertyValue('x', 50)
else:
    widget.setPropertyValue('x', 0)

## Y Position - Depending on the number of 'OR' inputs and the Input Number of the AND input.
if n_OR_inputs == 0 :
	OR_Offset=0
else:
	OR_Offset=(n_OR_inputs * 30) + 10

Y_Pos = OR_Offset + (InputNum * 30) - 10
widget.setPropertyValue('y', Y_Pos)

## Visibility - Hide if the input num is greater than the 'AND' inputs.
if InputNum>n_AND_inputs:
    widget.setPropertyValue('visible', False)
elif InputNum<=n_AND_inputs:
    widget.setPropertyValue('visible', True)
else:
    widget.setPropertyValue('visible', True)
