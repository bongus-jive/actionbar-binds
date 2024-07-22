local lastGroup, maxGroups, maxIndexes

function init()
  if not input then
    script.setUpdateDelta(0)
    sb.logWarn("'Action Bar Binds' requires StarExtensions or OpenStarbound")
    return
  end

  lastGroup = player.actionBarGroup()
  maxGroups = root.assetJson("/player.config:inventory.customBarGroups")
  maxIndexes = math.min(20, root.assetJson("/player.config:inventory.customBarIndexes"))
end

function update()
  if input.bindDown("pat_actionbarbinds", "prev") then
    local newGroup = ((lastGroup - 2) % maxGroups) + 1
    player.setActionBarGroup(newGroup)
  end

  lastGroup = player.actionBarGroup()

  if maxIndexes <= 6 then return end

  for i = 7, maxIndexes do
    if input.bindDown("pat_actionbarbinds", tostring(i)) then
      player.setSelectedActionBarSlot(i)
    end
  end
end
