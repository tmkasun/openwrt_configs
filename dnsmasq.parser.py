#!/usr/bin/env python3
mwan3_config = """
config rule '{name}'
    option proto 'all'
    option family 'ipv4'
    option sticky '1'
    option ipset '{name}'
    option use_policy 'SLT_Only'"""

def main():
    """
    Main function
    """
    with open('dnsmasq.conf') as f:
        lines = f.readlines()
        names = {}
        domains = {}
        for line in lines:
            if(line.startswith("ipset=")):
                name = line.rstrip().split('/')[-1]
                domain = line.rstrip().split('/')[-2]
                if not names.get(name):
                    names[name] = True
                else:
                    raise Exception("Name already exist = {}".format(name))
                if not domains.get(domain):
                    domains[domain] = True
                else:
                    raise Exception("Domain already exist = {}".format(domain))
                if len(name) > 15:
                    raise Exception("Name length exceed 15 max len = {}".format(name))
                # print("ipset -N {name} hash:ip".format(name=name))
                print(mwan3_config.format(name=name))
if __name__ == "__main__":
    main()