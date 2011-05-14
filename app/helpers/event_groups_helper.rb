module EventGroupsHelper
  def event_group_scoped_link(event_group, scope)
    link_to(event_group.send(scope), whoops_event_groups_path(scope => event_group.send(scope)))
  end
end
