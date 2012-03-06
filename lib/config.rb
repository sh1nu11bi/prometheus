module Config

# Track whether SNMP is enabled, to which servers traps are sent, and the
# community name used.
Snmp = Struct.new( :enabled, :trap_servers, :community )

# Track the interfaces that are allowed to manage the firewall and the 
# protocols allowed.
ManagementInterface = Struct.new( :enabled, :protocol, :interface )

# Track interfaces in use
Interface = Struct.new( :name, :ip, :mask, :http, :https, :ssh, :telnet)

# Track rules in rulesets
Rule = Struct.new( :id, :enabled, :source, :dest, :action, :service )

# Track access lists
class AccessList
	attr_accessor :name, :interface, :ruleset

	def initialize(name)
		@name = name
		@interface = nil
		@ruleset = Array.new
	end
end

class FirewallConfig
	attr_accessor :id, :date, :firmware, :type, :snmp
	attr_accessor :management, :access_lists, :interfaces
	#attr_accessor :nat_entries, :names, :groups
  
	def initialize
		@id = nil
		@date = nil
		@firmware = nil
		@type = nil
		@snmp = Snmp.new
		@access_lists = Array.new
		@interfaces = Array.new
		#@nat_entries = Array.new
		#@names = Hash.new
		#@groups = Hash.new
	end
			
end

end