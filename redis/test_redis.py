#!/bin/env python
import redis
import unittest

TYPE2ADD = {
        'hash': ['hmset', lambda x: [x]],
        'list': ['lpush', lambda x: x],
        'set':  ['sadd', lambda x: list(x)],
        'zset': ['zadd', lambda x: list(sum(x, ()))],
        }

class TestRedis(unittest.TestCase):
    """
    Test redis-py
    the usage is refer to https://redis-py.readthedocs.io/en/latest/
    """

    @classmethod
    def setUpClass(cls):
        super(TestRedis, cls).setUpClass()
        with open('.env') as f:
            pwd=f.readline().strip().split('=')[1]

        cls.redis_conn = redis.from_url('redis://:{0}@localhost:32770'.format(pwd))

    def test_set(self):
        l=['s1', 's2', 's3']
        #sets = set(l)
        key = 'r_set'
        #args = list(sets)
        #self.redis_conn.sadd(key, *args)
        args = [key] + TYPE2ADD['set'][1](l)
        getattr(self.redis_conn, TYPE2ADD['set'][0])(*args)
        self.assertEqual(len(l), self.redis_conn.scard(key))
        self.assertEqual(sorted(l), sorted(self.redis_conn.smembers(key)))
#        self.redis_conn.delete(key)

    def test_zset(self):
        l=[('z1', 1.0), ('z2', 2.0), ('z3', 3.0)]
        #zsets = sum(l, ())

        key = 'r_zset'
        #args = list(zsets)
        #self.redis_conn.zadd(key, *args)
        args = [key] + TYPE2ADD['zset'][1](l)
        getattr(self.redis_conn, TYPE2ADD['zset'][0])(*args)
        self.assertEqual(len(l), self.redis_conn.zcard(key))
        self.assertEqual(sorted(l), sorted(self.redis_conn.zrange(key, 0, -1, False, True)))
#        self.redis_conn.delete(key)

    def test_list(self):
        l=['l1', 'l2', 'l3']

        key = 'r_list'
        #args = l
        #self.redis_conn.lpush(key, *args)
        args = [key] + TYPE2ADD['list'][1](l)
        getattr(self.redis_conn, TYPE2ADD['list'][0])(*args)
        self.assertEqual(len(l), self.redis_conn.llen(key))
        self.assertEqual(sorted(l), sorted(self.redis_conn.lrange(key, 0, -1)))
#        self.redis_conn.delete(key)

    def test_hash(self):
        d={'h1':1, 'h2':2, 'h3':3}

        key = 'r_hash'
        #args = d
        #self.redis_conn.hmset(key, args)
        args = [key] + TYPE2ADD['hash'][1](d)
        getattr(self.redis_conn, TYPE2ADD['hash'][0])(*args)
        self.assertEqual(len(d), self.redis_conn.hlen(key))
        self.assertEqual(sorted(d), sorted(self.redis_conn.hgetall(key)))
#        self.redis_conn.delete(key)




if __name__ == '__main__':
    unittest.main(verbosity=2)
