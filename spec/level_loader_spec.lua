Level = require 'src.level_loader'

describe('Level.load', function()
  it('opens the correct level', function()
    Level.init('./assets/levels')
    level = Level.load('level1')
    assert.are.equal(level.title, 'Simplest Possible')
  end)
end)
