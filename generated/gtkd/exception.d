/**
 * Author: KonstantIMP <mihedovkos@gmail.com>
 * Date: Jun 26 2021
 */
module gtkd.exception;

import std.exception;

/** 
 * Exception for librarie loading errors
 */
class LinkException : Exception {
    this(string msg, string file = __FILE__, size_t line = __LINE__, Throwable nextInChain = null) pure nothrow @nogc @safe {
        super(msg, file, line, nextInChain);
    }
}

