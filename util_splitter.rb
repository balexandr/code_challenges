#!/usr/bin/env ruby

# Utility Splitter
# by Bryan Alexander - bryan@bryan-alexander.com
# http://www.bryan-alexander.com
#
# This program will take a certain number of roommates
# and their utilities and split them accordingly to output
# how much each person owes the other.
#
# First update the list of tenants and how much each person's
# room costs. Then add each utility, it's price and roommate who
# pays for it. You can add as many roommates or utilities as you want
# 
# Then run 'ruby util_splitter.rb' to see the output

def tenants
  {
    "bryan" => {
        "price" => 822
    },
    "julian" => {
        "price" => 647
    },
    "emily" => {
      "price" => 747
    }
  }
end

def utilities
  {
    "house" => {
      "price" => 2216,
      "payer" => "bryan"
    },
    "water" => {
      "price" => 72,
      "payer" => "bryan"
    },
    "cable" => {
      "price" => 94.90,
      "payer" => "julian"
    },
    "electric" => {
      "price" => 121.18,
      "payer" => "julian"
    },
    "gas" => {
      "price" => 31.88,
      "payer" => "julian"
    }
  }
end

def split_utilities(tenants={}, utilities={})
  puts "Tenant Owes Other Tenant: #{tenant_owes_tenant}"
  puts "Tenants Full Rent + Utilities: #{tenant_full_rent_and_utils}"
  puts "Total Utilities: $#{total_utils.round}"
  puts "Split Utilities: $#{(total_utils / 3).round}"
end

private

def tenant_owes_tenant
  tenant_hash = {}
  owes = {}

  tenants.each do | tenant, rent |
    total_cost_per_tenant = 0.00
    current_payer = ''

    utilities.each do | utility, responsibility |
       if tenant != responsibility['payer'] && utility != 'house'
        if current_payer != responsibility['payer']
          total_cost_per_tenant = 0.00
        end

        current_payer = responsibility['payer']

        if current_payer == pays_full_rent
          owed_rent = rent['price']
        else
          owed_rent = 0.00
        end

        total_cost_per_tenant += (responsibility['price'].to_f / 3).round
        owes[current_payer] = (total_cost_per_tenant.to_f).round + (owed_rent.to_f).round
       end
    end
    tenant_hash[tenant] = { 'owes' => owes }
    owes = {}
  end
  return tenant_hash
end

def tenant_full_rent_and_utils
  tenant_full_rent_and_utils = {}

  tenants.each do | tenant, rent |
    total_cost_per_tenant = 0.00

    utilities.each do | utility, responsibility |
      if tenant != responsibility['payer'] && utility != 'house'
        total_cost_per_tenant += (responsibility['price'].to_f / 3).round
      end
    end

    tenant_full_rent_and_utils[tenant] = (rent['price'] + total_cost_per_tenant.to_f).round
  end
  return tenant_full_rent_and_utils
end

# Sum of all utilities without overall rent
def total_utils
  total_utils = 0.00

  utilities.each do | utility, responsibility |
    total_utils += (responsibility['price'].to_f).round unless utility == 'house'
  end

  return total_utils
end

# Figure out who is paying the full rent
def pays_full_rent
  pays_full_rent = ""

  utilities.each do | utility, responsibility |
    pays_full_rent = responsibility['payer'] if utility == 'house'
  end

  return pays_full_rent
end

split_utilities(tenants, utilities)
