## Script for OR Block Behaviour

from org.csstudio.display.builder.runtime.script import PVUtil

## Process variable extraction
n_OR_inputs = PVUtil.getDouble(pvs[0])

## Block Height
BlockHeight = (n_OR_inputs * 30) + 20
widget.setPropertyValue('height', BlockHeight)

## Visibility - Hide if the Input Number is number of inputs is less than or equal to 1.
if n_OR_inputs <= 1:
    widget.setPropertyValue('visible', False)
else:
    widget.setPropertyValue('visible', True)