from org.csstudio.display.builder.runtime.script import PVUtil, ScriptUtil
from org.csstudio.display.builder.model import WidgetFactory

#with scriptContext('widget', 'pvs', 'PVUtil', dict=globals()):
value_z = PVUtil.getDouble(pvs[0])*-1;
widget.setPropertyValue("y", (value_z*10)+190)

