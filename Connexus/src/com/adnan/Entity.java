package com.adnan;

import java.util.List;

import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessType;

@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class Entity {
	private List<FileMeta> files;

  public Entity(List<FileMeta> files) {
    this.files = files;
  }

  public Entity() {
  }
}