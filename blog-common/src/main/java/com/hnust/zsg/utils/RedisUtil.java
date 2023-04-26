package com.hnust.zsg.utils;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Map;
import java.util.concurrent.TimeUnit;

@Component
public final class RedisUtil {

    private static RedisTemplate redisTemplate;

    public static final String LOGIN_USER_TOKEN="login:userId:";
    public static final String LOGIN_USERINFO="login:userinfo:userId:";

    @Autowired
    public void setRedisTemplate(RedisTemplate redisTemplate) {
        RedisUtil.redisTemplate = redisTemplate;
    }


    /**
     * @param key
     * @param value
     */
    public static void set(String key, Object value) {
        redisTemplate.opsForValue().set(key, value);
    }

    /**
     * 设置key-value，同时设置其过期时间，单位秒
     *
     * @param key
     * @param value
     * @param timeout
     */
    public static void set(String key, Object value, Long timeout, TimeUnit timeUnit) {
        //设置秒级过期时间
        redisTemplate.opsForValue().set(key, value, timeout, timeUnit);
    }

    /**
     * 设置设置key的过期时间（不单对string，其他类型也能设置）
     *
     * @param key
     * @param timeout
     */
    public static Boolean expire(String key, Long timeout) {
        return expire(key,timeout,TimeUnit.SECONDS);

    }

    public static Boolean expire(String key,Long timeout,TimeUnit timeUnit){
        return redisTemplate.expire(key,timeout,timeUnit);
    }

    /**
     * 在对应key的字符串后面添加value
     *
     * @param key
     * @param value
     */
    public static void append(String key, String value) {
        redisTemplate.opsForValue().append(key, value);
    }

    /**
     * 根据key获取string类型的value
     *
     * @param key
     * @return
     */
    public static String get(String key) {
        return (key != "") ? (String) redisTemplate.opsForValue().get(key) : null;
    }

    /**
     * 存储一个hash类型，不设置过期时间
     *
     * @param key   字符串类型的key
     * @param value 可以转成map的bean对象
     */
    public static void hset(String key, Object value) {
        hset(key, value, null);
    }

    /**
     * 存储一个设置过期时间的value
     *
     * @param key     字符串类型的key
     * @param value   可以转成map的bean对象
     * @param timeout 过期时间
     */
    public static void hset(String key, Object value, Long timeout) {
        Map map = JacksonUtil.beanToMap(value);
        redisTemplate.opsForHash().putAll(key, map);
        expire(key, timeout);
    }

    /**
     * 向hash类型中添加数据
     *
     * @param key
     * @param hashkey
     * @param value
     */
    public static void put(String key, String hashkey, Object value) {
        redisTemplate.opsForHash().put(key, hashkey, value);
    }

    /**
     *
     * @param key
     * @param map
     */
    public static void putAll(String key,Map map){
        redisTemplate.opsForHash().putAll(key,map);
    }

    /**
     * 根据key和field获取指定的value
     * @param key
     * @param field
     * @return
     */
    public static Object hget(String key, String field) {
        return redisTemplate.opsForHash().get(key, field);
    }

    /**
     * 根据key获取hash类型所有字段field和value
     *
     * @param key
     * @return
     */
    public static <K, V> Map<K, V> hget(String key) {
        return redisTemplate.opsForHash().entries(key);
    }

    /**
     * 根据key获取hash类型所有字段field和value
     *
     * @param key
     * @return
     */
    public static <T> T entries(String key, Class<T> clazz) {
        Map map = redisTemplate.opsForHash().entries(key);
        if (map.isEmpty()) {
            return null;
        }
        return (T) JacksonUtil.mapToBean(map, clazz);
    }

    /**
     * 判断Redis中是否存在指定名称的key
     * @param key
     * @return
     */
    public static Boolean hasKey(String key) {
        return redisTemplate.hasKey(key);
    }
}
