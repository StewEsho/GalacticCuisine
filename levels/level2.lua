return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 52,
  height = 6,
  tilewidth = 64,
  tileheight = 64,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "Platforms",
      firstgid = 1,
      tilewidth = 64,
      tileheight = 64,
      spacing = 0,
      margin = 0,
      image = "../art/level2/platforms.png",
      imagewidth = 192,
      imageheight = 192,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 9,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 52,
      height = 6,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["bgm"] = "music/tense.wav"
      },
      encoding = "lua",
      data = {
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 4,
        6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 6, 0, 0, 0, 0, 0, 0, 0, 1, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        6, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 6, 3, 0, 0, 0, 0, 0, 1, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4,
        6, 1, 2, 2, 2, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 4,
        6, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4
      }
    }
  }
}
