local Level = require 'src.level_loader'

describe('Level', function()
  describe('_get_rows', function()
    pending('need to figure out how to test privates')
    --[=[
    it('separates the rows from a layout', function()
      local layout = [[
      #####
      #@ .#
      #####
      ]]
      for row in Level._get_rows(layout) do
        assert.are.equal(5, #row)
      end
    end)
    ]=]
  end)

  describe('load', function()
    setup(function()
      Level.init('./assets/levels')
    end)

    it('opens the correct level', function()
      level = Level.load('level1')
      assert.are.equal('Simplest Possible', level.title)
    end)

    it("doesn't change the package.path outside of scope", function()
      local prev_path = package.path
      Level.load('level1')
      assert.are.equal(prev_path, package.path)
    end)
  end)
end)
