import { world } from "mojang-minecraft";

world.events.tick.subscribe(event => {
	for (var player of world.getPlayers()) {
		var v = player.getComponent("minecraft:inventory").container.getItem(player.selectedSlot);
		if (v && ["deferred:add_light", "deferred:fog_toggle", "deferred:shadow_toggle", "deferred:color_randomizer", "deferred:remove_light"].includes(v.id)) {
			try {
				player.runCommand(`playanimation @e[r=30,type=deferred:point_light] animation.deferred.point_light.lamp`);
			} catch {}
		}
	}
});

world.events.beforeChat.subscribe(event => {
	if (event.message == ".help") {
		event.cancel = true;
		event.sender.runCommand(`tellraw @s {"rawtext":[{"text": "§b#### Deferred Lighting Shader ####\n§a.help§r - displays this help message\n§a.col §2[red: int] [green: int] [blue: int]§r - gets or sets the closest light source color\n§a.pow §2{multiplier: float}§r - multiplies the closest light source color\n§a.add §2{red: int} {green: int} {blue: int}§r - adds to the closest light source color, accepts positive and negative values\n§a.mov§r - toggles moving the closest light source\n§gNote: light sources can only store colors in 0 - 4095 range"}]}`);
	}
	if (event.message == ".mov") {
		event.cancel = true;
		var tag = event.sender.hasTag("deferred:move");
		if (tag) {
			event.sender.removeTag("deferred:move");
		} else {
			event.sender.addTag("deferred:move");
		}
	}
	if (event.message.startsWith(".col")) {
		event.cancel = true;
		if (event.message == ".col") {
			event.sender.runCommand(`tellraw @s {"rawtext":[{"text":"§cR: "},{"score":{"name":"@e[c=1,r=10,type=deferred:point_light]","objective":"r"}},{"text":" §aG: "},{"score":{"name":"@e[c=1,r=10,type=deferred:point_light]","objective":"g"}},{"text":" §9B: "},{"score":{"name":"@e[c=1,r=10,type=deferred:point_light]","objective":"b"}}]}`);
		} else {
			var v = event.message.match(/\.col (\d+)\s+(\d+)\s+(\d+)/);
			var r = Math.min(Math.max(Math.round((v[1])), 0), 4095);
			var g = Math.min(Math.max(Math.round((v[2])), 0), 4095);
			var b = Math.min(Math.max(Math.round((v[3])), 0), 4095);
			
			try {
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] r ${r}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] g ${g}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] b ${b}`);
			
				event.sender.runCommand(`event entity @e[c=1, r=10, type=deferred:point_light] deferred:sync`);
			} catch {}
		}
	}
	if (event.message.startsWith(".pow")) {
		var v = event.message.match(/\.pow ([\d.]+)/);
		if (v) {
			event.cancel = true;
			
			try {
				var r = Math.min(4095, Math.max(0, Math.round(v[1]*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] r *`).statusMessage.match(/\w+ (\d+) /)[1])));
				var g = Math.min(4095, Math.max(0, Math.round(v[1]*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] g *`).statusMessage.match(/\w+ (\d+) /)[1])));
				var b = Math.min(4095, Math.max(0, Math.round(v[1]*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] b *`).statusMessage.match(/\w+ (\d+) /)[1])));
			
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] r ${r}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] g ${g}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] b ${b}`);
			
				event.sender.runCommand(`event entity @e[c=1, r=10, type=deferred:point_light] deferred:sync`);
			} catch {}
		}
	}
	if (event.message.startsWith(".add")) {
		var v = event.message.match(/\.add (-?\d+)\s+(-?\d+)\s+(-?\d+)/);
		if (v) {
			event.cancel = true;
			
			try {
				var r = Math.min(4095, Math.max(0, Math.round(1*v[1]+1*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] r *`).statusMessage.match(/\w+ (\d+) /)[1])));
				var g = Math.min(4095, Math.max(0, Math.round(1*v[2]+1*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] g *`).statusMessage.match(/\w+ (\d+) /)[1])));
				var b = Math.min(4095, Math.max(0, Math.round(1*v[3]+1*event.sender.runCommand(`scoreboard players test @e[type=deferred:point_light,c=1] b *`).statusMessage.match(/\w+ (\d+) /)[1])));
			
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] r ${r}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] g ${g}`);
				event.sender.runCommand(`scoreboard players set @e[c=1, r=10, type=deferred:point_light] b ${b}`);
			
				event.sender.runCommand(`event entity @e[c=1, r=10, type=deferred:point_light] deferred:sync`);
			} catch {}
		}
	}
});