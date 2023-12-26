from i3ipc import Connection


def find_gap(nums):
    """Returns a number where the preceding workspace ca be shifted to.
    Ex: find_gap([1,2,5]) => 3"""

    for idx, num in enumerate(nums):
        idx += 1
        if idx != num:
            # Found a gap where the previous ws can be shifted
            return idx
    # No gaps found. All ws are in sequential order. So...
    return len(nums) + 1


# Create connection with i3ipc
sway = Connection()

# Get the focused workspace from the WM tree
focused = sway.get_tree().find_focused().workspace()

# Get number of all workspaces
workspaces = sway.get_workspaces()
ws_nums = [w.num for w in workspaces]

# Find an empty workspace
empty_num = find_gap(ws_nums)

# Shift all workspaces one place right
# Start with the one before 'empty'
for i in range(empty_num-1, focused.num-1, -1):
    sway.command(f'rename workspace number {i} to {i+1}')

