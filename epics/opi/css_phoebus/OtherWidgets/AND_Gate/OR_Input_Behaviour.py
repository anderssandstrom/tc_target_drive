## Script for 'OR' Inputs behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])
##n_AND_inputs = PVUtil.getDouble(pvs[1])

## Macro variables
macros = widget.getEffectiveMacros()
macros.expandValues(macros)
InputNum = macros.getValue('InputNum')
InputNum = int(InputNum)

## X Position - Move inputs right 50pts if the number of OR inputs is <=1; otherwise position at the OR block.
## (This includes cases where 'AND' inputs >= 2)
if n_OR_inputs <= 1:
    widget.setPropertyValue('x', 50)
else:
    widget.setPropertyValue('x', 0)

## Y Position - Depending on the Input Number of the OR input. '-20'
Y_Pos = (InputNum * 30) - 10
widget.setPropertyValue('y', Y_Pos)

## Visibility - Hide if the Input Number is greater than the number or OR inputs.
if InputNum>n_OR_inputs:
    widget.setPropertyValue('visible', False)
elif InputNum<=n_OR_inputs:
    widget.setPropertyValue('visible', True)
else:
    widget.setPropertyValue('visible', True)
