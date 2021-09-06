from org.csstudio.display.builder.runtime.script import PVUtil, ScriptUtil
from org.csstudio.display.builder.model import WidgetFactory

#with scriptContext('widget', 'pvs', 'PVUtil', dict=globals()):
value_x = PVUtil.getDouble(pvs[0]);
value_y = PVUtil.getDouble(pvs[1])*-1;
#widget.setPropertyValue("x", (value_x*25)+1100)
#widget.setPropertyValue("y", (value_y*25)+950)
widget.setPropertyValue("x", (value_x*17.5)+210)
widget.setPropertyValue("y", (value_y*17.5)+210-40)

