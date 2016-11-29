<?xml version="1.0"?>
<xsl:transform version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xi="http://www.w3.org/2001/XInclude">
	<xsl:output method="xml" doctype-system="navit.dtd" cdata-section-elements="gui"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/config/navit/osd|/config/navit/gui|/config/navit/graphics"/>

	<xsl:template match="/config/navit">
		<xsl:copy>
			<xsl:apply-templates select="@*"/>
			<graphics type="sdl" w="480" h="272" bpp="16" frame="0" flags="1"/>
			<xsl:copy-of select="gui[@type='internal']"/>
			<osd enabled="yes" type="text" x="80" y="0" w="320" h="40" font_size="360" align="0" label="${{tracking.item.street_name}} ${{tracking.item.street_name_systematic}}" background_color="#00008080"/>
			<osd enabled="yes" type="text" x="80" y="232" w="80" h="40" font_size="360" align="0" label="${{navigation.item[1].length[named]}}" background_color="#00008080"/>
			<osd enabled="yes" type="text" x="160" y="232" w="240" h="40" font_size="360" align="0" label="${{vehicle.position_speed}} / ${{tracking.item.route_speed}}" background_color="#00008080"/>
			<osd enabled="yes" type="text" x="400" y="232" w="80" h="40" font_size="360" align="0" label="${{navigation.item.destination_length[named]}}" background_color="#00008080"/>
			<osd enabled="yes" type="text" x="400" y="192" w="80" h="40" font_size="360" align="0" label="${{navigation.item.destination_time[arrival]}}" background_color="#00008080"/>
			<osd enabled="yes" type="compass" x="400" y="80" w="80" h="112" background_color="#00008080" font_size="300"/>
			<osd enabled="yes" type="gps_status" x="0" y="80" w="80" h="40" background_color="#00008080"/>
			<osd enabled="yes" type="speed_warner" x="0" y="120" w="80" h="72" background_color="#00008080" font_size="300"/>
			<osd enabled="yes" type="navigation_next_turn" x="0" y="192" w="80" h="80" icon_w="48" icon_h="48" icon_src="%s_wh_48_48.png" background_color="#00008080"/>
			<osd enabled="yes" type="button" x="400" y="0" command="zoom_in()" src="tomtom_plus_80_80.png"/>
			<osd enabled="yes" type="button" x="0" y="0" command="zoom_out()" src="tomtom_minus_80_80.png"/>
			<xsl:apply-templates select="node()"/>
		</xsl:copy>
	</xsl:template>
</xsl:transform>
