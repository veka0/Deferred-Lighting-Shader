# Deferred-Lighting-Shader
This add-on brings colored lights to MCPE 1.18.12 by using custom deferred rendering pipeline.
##  Usage Requirements
The following conditions has to be met in order to use this add-on
- Minecraft: Pocket Edition (Bedrock Edition for mobile devices) 1.18.12
	- May or may not work on versions prior to 1.18.12
	- Doesn't work on newer versions because of Render Dragon
- Support for `GL_ARM_shader_framebuffer_fetch_depth_stencil` and either `GL_EXT_shader_framebuffer_fetch` or `GL_ARM_shader_framebuffer_fetch` GLSL extensions
	- OpenGL ES 3.0
	- ARM processor
- Experimental toggles
	- Holiday Creator Features
	- Upcoming Creator Features
	- GameTest Framework
	- Molang Features
##  Features
> Note: light sources can only store colors in 0 - 4095 range, as integers
- #### Items
	- `deferred:add_light`
	- `deferred:remove_light`
	- `deferred:color_randomizer`
	- `deferred:fog_toggle`
	- When holding either item, all light sources within 30 blocks will have a lightbulb billboard icon displayed over them
- #### Chat commands
	- `.help` displays help message
	- `.col` gets the closest light source color
	- `.col 100 200 300` sets the closest light source color to RGB = [100, 200, 300]
	- `.pow 1.5` multiplies the closest light source color/brightness by 1.5
	- `.add 100 0 -200` adds 100 red, 0 green and subtracts 200 blue from the closest light source color
	- `.mov` allows to move closest light source
- #### Command integration
	- Light sources are represented with `deferred:point_light` entities
	- Color is stored in `r`, `g` and `b` scoreboards
	- Fog is controlled by `deferred:fog` tag
	- After changing color or fog, `deferred:sync` event must be used to synchronize the changes
	- `deferred:despawn` event has to be used to remove light sources, since they're invulnerable otherwise (even to `/kill`)
	- `deferred:random_color` event randomizes color
	- `deferred:switch_fog` event toggles fog On and Off
- #### HDR
	- Exposure can be adjusted by looking directly down and rotating the camera clockwise and counterclockwise
	- Looking directly up resets the exposure to 100%
	- Exposure ranges from 10% to 100%
	- During adjustment, exposure percentage indicator is visible
## New HDR Screenshots
> Hover over a screenshot to see which map was used, click on it to get to the download page

![Vanilla screenshot](https://cdn.discordapp.com/attachments/286649185468678144/1047808803787259964/Screenshot_20221201-103239.png "Vanilla screenshot")

[![Le Ultimate RTX (Java map)](https://cdn.discordapp.com/attachments/286649185468678144/1064585222382960731/Screenshot_20230116-173810.png "Le Ultimate RTX (Java map)")](https://www.mediafire.com/file/of1821ywjctxzyh/le_ultimate_rtx14.zip/file "Le Ultimate RTX (Java map)")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/327203882180542484/1053407853194522784/Screenshot_20221216-212409.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/327203882180542484/1052766900523905074/Screenshot_20221215-013211.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/327203882180542484/1064878304995332116/Screenshot_20230117-130355.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/327203882180542484/1052589068875202622/Screenshot_20221208-023141.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/286649185468678144/1055939267240656896/Screenshot_20221223-175756.png "Vanilla screenshot")


##  Old Screenshots

[![Minecraft RTX (Gamescom 2019) Map recreation](https://cdn.discordapp.com/attachments/286649185468678144/1030978698444279818/Screenshot_20221016-005412.png "Minecraft RTX (Gamescom 2019) Map recreation")](https://www.planetminecraft.com/project/minecraft-rtx-gamescom-2019-map "Minecraft RTX (Gamescom 2019) Map recreation")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/286649185468678144/1033152995279523970/Screenshot_20221021-162213.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/286649185468678144/1036565117397123072/Screenshot_20221031-093741.png "Vanilla screenshot")

![Vanilla screenshot](https://cdn.discordapp.com/attachments/286649185468678144/1017301469629792328/Screenshot_20220907-155427.png "Vanilla screenshot")

[![Cyberpunk Project by Elysium Fire](https://cdn.discordapp.com/attachments/286649185468678144/1028096038294257745/Screenshot_20221008-014111.png "Cyberpunk Project by Elysium Fire")](https://www.planetminecraft.com/project/cyberpunk-project-timelapse "Cyberpunk Project by Elysium Fire")

[![Cyberpunk Project by Elysium Fire](https://cdn.discordapp.com/attachments/286649185468678144/1028096006774075533/Screenshot_20221008-014756.png "Cyberpunk Project by Elysium Fire")](https://www.planetminecraft.com/project/cyberpunk-project-timelapse "Cyberpunk Project by Elysium Fire")

[![Cyberpunk Project by Elysium Fire](https://cdn.discordapp.com/attachments/286649185468678144/1025873851499946054/Screenshot_20221001-225343.png "Cyberpunk Project by Elysium Fire")](https://www.planetminecraft.com/project/cyberpunk-project-timelapse "Cyberpunk Project by Elysium Fire")

[![Cyberpunk Project by Elysium Fire](https://cdn.discordapp.com/attachments/286649185468678144/1035885131182919741/Screenshot_20221008-013644.png "Cyberpunk Project by Elysium Fire")](https://www.planetminecraft.com/project/cyberpunk-project-timelapse "Cyberpunk Project by Elysium Fire")

[![Cyberpunk Project by Elysium Fire](https://cdn.discordapp.com/attachments/286649185468678144/1030990271606956132/Screenshot_20221016-014551.png "Cyberpunk Project by Elysium Fire")](https://www.planetminecraft.com/project/cyberpunk-project-timelapse "Cyberpunk Project by Elysium Fire")

[![Project Cerus by legendaryIV25](https://cdn.discordapp.com/attachments/286649185468678144/1031004875707916341/Screenshot_20221016-004417.png "Project Cerus by legendaryIV25")](https://mcpedl.com/project-cerus-5k-by-5k-custom-terrain/ "Project Cerus by legendaryIV25")

[![Project Cerus by legendaryIV25](https://cdn.discordapp.com/attachments/286649185468678144/1030975709243506688/Screenshot_20221016-004216.png "Project Cerus by legendaryIV25")](https://mcpedl.com/project-cerus-5k-by-5k-custom-terrain/ "Project Cerus by legendaryIV25")

[![Project Cerus by legendaryIV25](https://cdn.discordapp.com/attachments/286649185468678144/1030975737903190107/Screenshot_20221016-004514.png "Project Cerus by legendaryIV25")](https://mcpedl.com/project-cerus-5k-by-5k-custom-terrain/ "Project Cerus by legendaryIV25")

[![Project Cerus by legendaryIV25](https://cdn.discordapp.com/attachments/286649185468678144/1024441140843389049/Screenshot_20220927-235427.png "Project Cerus by legendaryIV25")](https://mcpedl.com/project-cerus-5k-by-5k-custom-terrain/ "Project Cerus by legendaryIV25")

	
