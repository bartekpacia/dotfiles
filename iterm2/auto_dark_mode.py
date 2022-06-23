#!/usr/bin/env python3

import asyncio
import iterm2

async def get_preset(connection, theme_parts) -> str:
    # Themes have space-delimited attributes, one of which will be light or dark.
    if "dark" in theme_parts:
        preset = await iterm2.ColorPreset.async_get(connection, "Dark Background")
    else:
        preset = await iterm2.ColorPreset.async_get(connection, "Light Background")
    
    return preset

async def main(connection):
    app = await iterm2.async_get_app(connection)
    theme = await app.async_get_theme()
    preset = await get_preset(connection, theme)

    # Update the list of all profiles and iterate over them.
    profiles = await iterm2.PartialProfile.async_query(connection)
    for partial in profiles:
        # Fetch the full profile and then set the color preset in it.
        profile = await partial.async_get_full_profile()
        await profile.async_set_color_preset(preset)

    async with iterm2.VariableMonitor(connection, iterm2.VariableScopes.APP, "effectiveTheme", None) as monitor:
        while True:
            # Block until theme changes
            theme = await monitor.async_get()
            preset = await get_preset(connection, theme)

            # Update the list of all profiles and iterate over them.
            profiles = await iterm2.PartialProfile.async_query(connection)
            for partial in profiles:
                # Fetch the full profile and then set the color preset in it.
                profile = await partial.async_get_full_profile()
                await profile.async_set_color_preset(preset)

iterm2.run_forever(main)
