require_relative('../models/bounty.rb')

Bounty.delete_all()

bounty1 = Bounty.new({
  'name' => 'Boba Fett',
  'bounty_value' => 9000,
  'danger_level' => 'High',
  'last_known_location' => 'Kamino'
  })
  bounty1.save()
