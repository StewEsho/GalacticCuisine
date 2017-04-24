return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.18.2",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 60,
  height = 10,
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
      imageheight = 256,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 12,
      tiles = {
        {
          id = 0,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 1,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 2,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 3,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "wall"
          }
        },
        {
          id = 4,
          properties = {
            ["category"] = 4,
            ["isSolid"] = false,
            ["userData"] = "background"
          }
        },
        {
          id = 5,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "wall"
          }
        },
        {
          id = 6,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 7,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 8,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "ground"
          }
        },
        {
          id = 9,
          properties = {
            ["category"] = 4,
            ["isSolid"] = true,
            ["userData"] = "wall"
          }
        },
        {
          id = 10,
          properties = {
            ["category"] = 5,
            ["isSolid"] = true,
            ["userData"] = "goal"
          }
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Tile Layer 1",
      x = 0,
      y = 0,
      width = 60,
      height = 10,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {
        ["b"] = 98,
        ["bgColor"] = true,
        ["bgm"] = "music/tense.wav",
        ["g"] = 65,
        ["r"] = 76
      },
      encoding = "lua",
      data = {
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 8, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 9, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 10,
        10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 6, 0, 0, 0, 0, 0, 0, 0, 1, 5, 5, 5, 5, 5, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 11, 10,
        10, 0, 0, 0, 0, 0, 0, 7, 8, 8, 8, 8, 8, 8, 8, 8, 8, 9, 5, 5, 5, 5, 5, 5, 5, 5, 5, 6, 4, 5, 6, 3, 0, 0, 0, 0, 0, 1, 5, 5, 5, 5, 5, 5, 6, 0, 0, 0, 7, 8, 9, 0, 0, 0, 0, 10, 11, 11, 11, 10,
        10, 1, 2, 2, 2, 2, 2, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 1, 3, 10, 11, 11, 11, 10,
        10, 4, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 10, 10, 10, 10, 10
      }
    }
  }
}
